Freeze Ray
==========

> "With my freeze ray I will stop the pain."  --Dr. Horrible

The problem
-----------

ActiveRecord's dirty tracking feature is broken.  Awesome, but broken.  Let me demonstrate.

    >> p = Post.last
    => #<Post id: 261, ... >
    >> p.title
    => "A quick update"
    >> p.changes
    => {}
    >> p.title << " about my pet frogs"
    => "A quick update about my pet frogs"
    >> p.changes
    => {}

Hang on, now!  We changed the title!  Why didn't we see this?

    => {"title"=>["A quick update", "A quick update about my pet frogs"]}

Because ActiveRecord doesn't have any way of knowing that we changed the attribute.  That's because we **mutated it in place**.  Rather than replace the string with a new one, *we changed the one it already had*.  That doesn't involve calling `#title=` on the Post, so the Post doesn't realize that the actual value changed.

ActiveRecord provides one solution: call `#title_will_change!` first.  That tells the Post to remember the current value of the title to compare to the old one.  Observe:

    >> p.title << " whom I love dearly"
    => "A quick update about my pet frogs whom I love dearly"
    >> p.changes
    => {"title"=>["A quick update about my pet frogs", "A quick update about my pet frogs whom I love dearly"]}

Well, sure, that works.  But you have to be careful.  What if you forget to that at some point?


Another Solution
----------------

Freeze Ray offers another solution.  Just mark the attributes you want to track as `attr_frozen`:

    class Post < ActiveRecord::Base
      attr_frozen :title
    end

Now try to mess up dirty tracking:

    >> p = Post.last
    => #<Post id: 261, ... >
    >> p.title
    => "A quick update"
    >> p.title << " about my pet frogs"
    TypeError: can't modify frozen string
            from (irb):36:in `<<'
            from (irb):36
    >> p.title
    => "A quick update"
    >> p.title.frozen?
    => true

You can't do it!

Obviously, this isn't very useful in a case where you need to change attribute objects in place.  On the other hand, I can't think of a reason you'd *want* to change them in place.  Now, if you try, you'll know.


This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

[Original article](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html)

# The Stack and the Heap

In many programming languages, you don’t have to think about the stack
and the heap very often. But in a systems programming language like Rust,
whether a value is on the stack or the heap has more of an effect on
how the language behaves and why you have to make certain decisions.
Parts of ownership will be described in relation to the stack
and the heap later in this chapter, so here is a brief explanation in preparation.

Both the stack and the heap are parts of memory
that are available to your code to use at runtime,
but they are structured in different ways.
The stack stores values in the order it gets them
and removes the values in the opposite order.
This is referred to as last in, first out.
Think of a stack of plates: when you add more plates,
you put them on top of the pile, and when you need a plate,
you take one off the top. Adding or removing plates from the middle or bottom
wouldn’t work as well! Adding data is called pushing onto the stack,
and removing data is called popping off the stack.

The stack is fast because of the way it accesses the data: it never has to search
for a place to put new data or a place to get data from because
that place is always the top. Another property that makes the stack fast is
that all data on the stack must take up a known, fixed size.

Data with a size unknown at compile time or a size that might change can be
stored on the heap instead. The heap is less organized:
when you put data on the heap, you ask for some amount of space.
The operating system finds an empty spot somewhere in the heap that is big enough,
marks it as being in use, and returns a pointer,
which is the address of that location. This process is called allocating on the heap,
sometimes abbreviated as just “allocating.”
Pushing values onto the stack is not considered allocating.
Because the pointer is a known, fixed size, you can store the pointer on the stack,
but when you want the actual data, you have to follow the pointer.

Think of being seated at a restaurant. When you enter,
you state the number of people in your group, and the staff finds an empty table
that fits everyone and leads you there. If someone in your group comes late,
they can ask where you’ve been seated to find you.

Accessing data in the heap is slower than accessing data on the stack
because you have to follow a pointer to get there.
Contemporary processors are faster if they jump around less in memory.
Continuing the analogy, consider a server at a restaurant taking orders
from many tables. It’s most efficient to get all the orders at one table
before moving on to the next table. Taking an order from table A,
then an order from table B, then one from A again,
and then one from B again would be a much slower process. By the same token,
a processor can do its job better if it works on data that’s close to other data
(as it is on the stack) rather than farther away (as it can be on the heap).
Allocating a large amount of space on the heap can also take time.

When your code calls a function, the values passed into the function
(including, potentially, pointers to data on the heap)
and the function’s local variables get pushed onto the stack.
When the function is over, those values get popped off the stack.

Keeping track of what parts of code are using what data on the heap,
minimizing the amount of duplicate data on the heap,
and cleaning up unused data on the heap so you don’t run out of space are all problems
that ownership addresses. Once you understand ownership,
you won’t need to think about the stack and the heap very often,
but knowing that managing heap data is why ownership exists can help explain
why it works the way it does.

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)
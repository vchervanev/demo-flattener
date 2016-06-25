#About

Test array flattener aimed to:

- minimize extra memory usage
- support any object as array's content

#Using with IRB

```
> cd <project_folder>
> irb -Ilib
irb> require 'flattener'
irb> Flattener.perform([1, 2, [3, 4])
[1, 2, 3, 4]
```
#Running tests

Use `rake` to run test suit.
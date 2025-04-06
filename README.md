# bloxidize

A set of roblox / lune luau compatible rust inspired packages, with the goal of supporting safer coding practices without necessarily doing a 1-to-1 port.

## library

All of the following are published on Wally and NPM. It is recommended you download them individually for a better experience, but if you wish to just try out all of them this repository provides an interface that allows access to all of them published on Wally and NPM.

### [option](https://github.com/nightcycle/option)

This class is a safer way to handle null values.

### [result](https://github.com/nightcycle/result)

This class is a safer way to handle errors.

### [future](https://github.com/nightcycle/future)

This class is a handy way to handle async processes.

### [error](https://github.com/nightcycle/error)

This class is a handy way to bundle up error context to allow for better handling in code + easier debugging.

### [vec](https://github.com/nightcycle/vec)

This class is a safer way to work with lists / arrays.

### [hash-map](https://github.com/nightcycle/hash-map)

This class is a safer way to work with dictionaries.

### [vec-deque](https://github.com/nightcycle/vec-deque)

This class is a safer way to work with queues.

### [serde-json](https://github.com/nightcycle/serde-json)

This library is a safer way to work with customized json serialization / deserialization into custom classes.

### [reqwest (pre-release)](https://github.com/nightcycle/reqwest)

This library is a safer way to work with http requests.

## contributing

Please contribute bug reports on the respective repository, for the most part though I'm not looking to add new APIs until Roblox's type engine gets more efficient - already with this minimal coverage things are getting pretty slow. Thank you!

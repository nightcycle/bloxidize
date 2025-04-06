# bloxidize

A set of roblox / lune luau compatible rust inspired packages, with the goal of supporting safer coding practices without necessarily doing a 1-to-1 port.

## library

All of the following are published on Wally and NPM. It is recommended you download them individually for a better experience, but if you wish to just try out all of them this repository provides an interface that allows access to all of them published on Wally and NPM.

### option

The [Option](https://github.com/nightcycle/option) class is a safer way to handle null values.

### result

The [Result](https://github.com/nightcycle/result) class is a safer way to handle errors.

### future

The [Future](https://github.com/nightcycle/future) class is a handy way to handle async processes.

### error

The [Error](https://github.com/nightcycle/error) class is a handy way to bundle up error context to allow for better handling in code + easier debugging.

### vec

The [Vec](https://github.com/nightcycle/vec) class is a safer way to work with lists / arrays.

### hash-map

The [HashMap](https://github.com/nightcycle/hash-map) class is a safer way to work with dictionaries.

### vec-deque

The [VecDeque](https://github.com/nightcycle/vec-deque) class is a safer way to work with queues.

### reqwest

The [Reqwest](https://github.com/nightcycle/reqwest) library is a safer way to work with http requests.

### serde-json

The [SerdeJson](https://github.com/nightcycle/serde-json) library is a safer way to work with customized json serialization / deserialization into custom classes.

## contributing

Please contribute bug reports on the respective repository, for the most part though I'm not looking to add new APIs until Roblox's type engine gets more efficient - already with this minimal coverage things are getting pretty slow. Thank you!

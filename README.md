
## tmate.clj

An experiment to share a tmux session code via [tmate.io](https://tmate.io/)
with the benefits of restricting the access to the running container.

The idea comes from
[Wrapping Clojure Development Tooling in a Containers](https://github.com/markmandel/wrapping-clojure-tooling-in-containers)

## Usage

### Building

````
git clone https://github.com/iperdomo/tmate.clj.git && cd tmate.clj
docker build -t <TAG> .
````

### Running

* Copy the helper bash script script [tmate.me](https://raw.githubusercontent.com/iperdomo/tmate.clj/master/tmate.me) in your `$PATH`
* Set execution permission `chmod a+x tmate.me`
* Move to your Clojure project
* Execute: `tmate.me`

## License

Apache License 2.0

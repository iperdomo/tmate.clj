
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

Move to your Clojure project root folder and execute

````
docker run --rm --name=<NAME> \
  -e HOST_GID=`id -g` \
  -e HOST_UID=`id -u` \
  -e HOST_USER="$USER" \
  -v ~/.m2:"/home/$USER/.m2" \
  -v "$PWD":/project -it <TAG> /root/startup.sh

````

## Todo

* Use Alpine Linux based container to reduce size

## License

Apache License 2.0

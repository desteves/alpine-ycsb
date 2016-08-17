# alpine-ycsb
Dockerfile with Alpine latest (3.4) base and the [YCSB](https://github.com/brianfrankcooper/YCSB) 0.10.0 release.

# Docker Pull Command
```docker pull nullstring/alpine-ycsb```


# Docker Run
## Default (displays help)
```docker run  nullstring/alpine-ycsb```

## With sample arguments (IN PROGRESS!!!!!)
```docker run  nullstring/alpine-ycsb load mongodb -P workloads/workloada -p mongodb.batchsize=100 -p mongodb.url=mongodb://${server}:${port}/ycsb?w=0&connectTimeoutMS=5 -p insertcount=300000000 -threads 32 >> /dev/null 2> /dev/null ```


# Todo
# Testing, testing, testing

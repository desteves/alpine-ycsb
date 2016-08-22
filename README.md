# alpine-ycsb
Dockerfile with Alpine latest (3.4) base and the [YCSB](https://github.com/brianfrankcooper/YCSB) 0.10.0 release.

# Docker Pull Command
```docker pull nullstring/alpine-ycsb```

# Docker Run
* Default
  ```docker run  nullstring/alpine-ycsb```
* With sample arguments for MongoDB
  * If you have a mongo container, get the IP addresss.
  Example with [mongo](https://hub.docker.com/_/mongo/) image:
  ```
    docker run -p 27017:27017 --name mangoduck -d mongo
    docker inspect -f "{{ .NetworkSettings.IPAddress }}" mangoduck
    #copy the ip from the above command output and paste below as: (Here we had 172.17.0.2)
    docker run nullstring/alpine-ycsb load mongodb -P workloads/workloada -p mongodb.url=mongodb://172.17.0.2:27017/ycsb?w=0
  ```
  * After the workload finished running, the summary output will read something like:
  ```
  [OVERALL], RunTime(ms), 1704.0
  [OVERALL], Throughput(ops/sec), 586.8544600938967
  [TOTAL_GCS_MarkSweepCompact], Count, 0.0
  [TOTAL_GC_TIME_MarkSweepCompact], Time(ms), 0.0
  [TOTAL_GC_TIME_%_MarkSweepCompact], Time(%), 0.0
  [TOTAL_GCS_Copy], Count, 7.0
  [TOTAL_GC_TIME_Copy], Time(ms), 25.0
  [TOTAL_GC_TIME_%_Copy], Time(%), 1.4671361502347418
  [TOTAL_GCs], Count, 7.0
  [TOTAL_GC_TIME], Time(ms), 25.0
  [TOTAL_GC_TIME_%], Time(%), 1.4671361502347418
  [CLEANUP], Operations, 1.0
  [CLEANUP], AverageLatency(us), 2739.0
  [CLEANUP], MinLatency(us), 2738.0
  [CLEANUP], MaxLatency(us), 2739.0
  [CLEANUP], 95thPercentileLatency(us), 2739.0
  [CLEANUP], 99thPercentileLatency(us), 2739.0
  [INSERT], Operations, 1000.0
  [INSERT], AverageLatency(us), 1136.031
  [INSERT], MinLatency(us), 318.0
  [INSERT], MaxLatency(us), 78591.0
  [INSERT], 95thPercentileLatency(us), 3569.0
  [INSERT], 99thPercentileLatency(us), 8223.0
  [INSERT], Return=OK, 1000
  ```
  * You can verify the YCSB documents were written to the mandoduck container via:
  ```
  docker exec mangoduck mongo ycsb --eval "db.usertable.count()"
  docker exec mangoduck mongo ycsb --eval "db.usertable.findOne().pretty()"
  ```
* Override the entrypoint to shell
  ```docker run -it --entrypoint /bin/sh nullstring/alpine-ycsb```

# Todo
* Testing, testing, testing

## Redis Server Setup ##
### Installation ###
1. Download `redis-<version>.tar.gz` from [https://github.com/ServiceStack/redis-windows/raw/master/downloads/redis-latest.zip](https://github.com/ServiceStack/redis-windows/raw/master/downloads/redis-latest.zip)
2. Extract `redis-latest.zip` in `c:\redis`
3. Run `redis-server.exe` using local configuration
	1. `cd c:\redis`
	2. `redis-server.exe redis.windows.conf`
4. Run `redis-cli.exe` to connect to redis instance
	1. `cd c:\redis`
	2. `redis-cli.exe`
5. Testing
		
		redis 127.0.0.1:6379> SET foo bar
		OK
		redis 127.0.0.1:6379> KEYS *
		1) "foo"
		redis 127.0.0.1:6379> GET foo
		"bar"
### Running Redis as a Service ###

### Redis React Browser ###

### Redis Sentinel Servers ###

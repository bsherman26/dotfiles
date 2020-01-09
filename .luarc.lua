--testing = "Cool"
--print(testing)

-------------------
-- Libraries
-------------------
Libs = {

    -------------------
    -- Repos
    -------------------
    all = {

        mine      = {
            name        = "Mine";
            description = "Play C Library";
            require     = "libgiveLua";
        };

        lfs       = {
            name        = "lfs";
            description = "Lua File System";
            require     = "lfs";
        };

        argparse  = {
            name        = "Arg Parse";
            description = "Argument Parsing Utilities";
            require     = "argparse";
        };

        luv       = {
            name        = "Lua Luv";
            description = "Luv for Lua (Like Node.js)";
            require     = "luv";
        };

        redis     = {
            name        = "Redis";
            description = "Lua Redis Client";
            require     = "redis";

            connect = function(self)

                local name   = "redis"

                local ip     = "127.0.0.1"
                local port   = 6379

                local redis  = Libs.repo_get(self)

                local client = redis.connect(ip, port)

                self.client  = client

                client:ping()

                return client
            end
        };

        mongo     = {
            name        = "MongoDB";
            description = "Lua MongoDB Client";
            require     = "mongo";

            mdb_connect = function()

                name          = "mongo"
                local url     = 'mongodb://127.0.0.1'

                local mongo   = Libs.repo_get(self)

                local client  = mongo.Client(url)

                return client

                -----------------------
                -- Common variables
                -----------------------
                --local collection = client:getCollection('lua-mongo-test', 'test')
                --collection:drop() -- Clear collection
                --local id = mongo.ObjectID()
                --local query1 = mongo.BSON('{ "age" : { "$gt" : 25 } }')
                --local query2 = mongo.BSON{_id = id}
            end
        };

        lsqlite3  = {
            name        = "SQLite3";
            description = "Lua SQLite3 Client";
            require     = "lsqlite3";
        };

        socket    = {
            name        = "Socket";
            description = "Socket Stuff";
            require     = "socket";
        };


        -- TODO: Fig Out:
        --mine = require("cjson");       -- cjson  TODO: Broken
        --??? = require("luacheck");
    };

    -------------------
    -- Methods
    -------------------

    ls = function()
        --pNext(Libs.all)
        for p, v in next, Libs.all do
            io.write(
                string.format("%10s => %s\n", p, v.name)
                --string.format("%s => %.2f\n", p, t[p])
            )
        end
    end;

    loaded = function()
        --pNext(Libs.live)
        local all  = Libs.all
        local live = Libs.live
        for p, v in next, live do
            io.write(
                string.format("%10s => %s\n", p, all[p].name)
                --string.format("%s => %.2f\n", p, t[p])
            )
        end
    end;

    repo_get = function(self)
        local name = self.require
        local lib  = Libs.live[name]
        if(not lib) then
            lib = require(name)
            if(lib) then
                Libs.live[name] = lib
            end
        end
        return lib
    end;

    load     = repo_get;

    conn     = function(name)
        local repo = Libs.all[name]
        if(repo) then
            local func = repo.connect
            if(func) then
                return repo:connect()
            end
        end
    end;

    live = {};
}


--d = "/home/brian"
--mine:dir(d)
--mine:l_dir(d)

pNext = function(t)
    for p, v in next, t do
        io.write(
            string.format("%10s => %s\n", p, v)
            --string.format("%s => %.2f\n", p, t[p])
        )
    end
end

pArray = function(t)
    for i,v in ipairs(t) do
        io.write(
            string.format("%3d => %s\n", i, v)
            --string.format("%s => %.2f\n", p, t[p])
        )
    end
end

-- pwd
pwd = function()
    return os.getenv("PWD")
end

-- ls(dir)
ls = function(path)

    if(not path) then
        path = pwd()

    elseif(string.sub(path,1,1) ~= "/") then
        path = pwd() .. "/" .. path
    end

    print(path)
    --pArray(table.sort(mine.dir(path)))
    ds = mine.dir(path)
    table.sort(ds)
    pArray(ds)
end

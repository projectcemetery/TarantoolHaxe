/*
 * Copyright (c) 2017 Grabli66
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package tarantool.box;

/**
 *  Config structure for boxcfg function
 */
typedef BoxOptions = {
    /**
     *  The read/write data port number or URI (Universal Resource Identifier) string.
     *  Has no default value, so must be specified if connections will occur from remote clients that do not use the “admin port”.
     *  Connections made with listen = URI are sometimes called “binary protocol” or “primary port” connections.
     *  A typical value is 3301
     */
    listen : Int,

    /**
     *  Store the process id in this file. Can be relative to work_dir. A typical value is “tarantool.pid”.
     */
    ?pid_file : String,

    /**
     *  Put the server in read-only mode. After this, any requests that try to change data will fail with error ER_READONLY.
     */
    ?read_only : Bool,

    /**
     *  A directory where snapshot (.snap) files will be stored. Can be relative to work_dir. If not specified, defaults to work_dir. See also wal_dir.
     */
    ?snap_dir : String,

    /**
     *  A directory where vinyl files or subdirectories will be stored. Can be relative to work_dir. If not specified, defaults to work_dir.
     */
    ?vinyl_dir : String,

    /**
     *  UNIX user name to switch to after start.
     */
    ?username : String,

    /**
     *  A directory where write-ahead log (.xlog) files are stored. Can be relative to work_dir.
     *  Sometimes wal_dir and snap_dir are specified with different values, so that write-ahead log files and snapshot files can be stored on different disks.
     *  If not specified, defaults to work_dir.
     */
    ?wal_dir : String,

    /**
     *  A directory where database working files will be stored. The server switches to work_dir with chdir(2) after start. 
     *  Can be relative to the current directory. If not specified, defaults to the current directory. 
     *  Other directory parameters may be relative to work_dir.   
    **/
    ?work_dir : String,

    /**
     *  How much memory Tarantool allocates to actually store tuples, in gigabytes. 
     *  When the limit is reached, INSERT or UPDATE requests begin failing with error ER_MEMORY_ISSUE. 
     *  While the server does not go beyond the defined limit to allocate tuples, there is additional memory used to store indexes and connection information.
     *  Depending on actual configuration and workload, Tarantool can consume up to 20% more than the limit set here.
    **/
    ?slab_alloc_arena : Float,

    /**
     *  Use slab_alloc_factor as the multiplier for computing the sizes of memory chunks that tuples are stored in. 
     *  A lower value may result in less wasted memory depending on the total amount of memory available and the distribution of item sizes.
    **/
    ?slab_alloc_factor : Float,

    /**
     *  Size of the largest allocation unit. It can be increased if it is necessary to store large tuples.
    **/
    ?slab_alloc_maximal : Float,

    /**
     *  Size of the smallest allocation unit. It can be decreased if most of the tuples are very small. The value must be between 8 and 1048280 inclusive.
    **/
    ?slab_alloc_minimal : Int,



    /**
     *  By default, the log is sent to the standard error stream (stderr). 
     *  If logger is specified, the log is sent to a file, or to a pipe, or to the system logger.
    **/
    ?logger : String,

    /**
     *  By setting log_level, one can enable logging of all classes below or equal to the given level. 
     *  Tarantool prints its logs to the standard error stream by default, but this can be changed with the logger configuration paramete
    **/
    ?log_level : Int,

    /**
     *  If logger_nonblock equals true, Tarantool does not block on the log file descriptor when it’s not ready for write, and drops the message instead. 
     *  If log_level is high, and a lot of messages go to the log file, setting logger_nonblock to true may improve logging performance at the cost of some log messages getting lost.
    **/
    ?logger_nonblock : Bool,

    /**
     *  If processing a request takes longer than the given value (in seconds), warn about it in the log. 
     *  Has effect only if log_level is more than or equal to 4 (WARNING).
    **/
    ?too_long_threshold : Float
}
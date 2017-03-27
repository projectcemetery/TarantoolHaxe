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

package tarantool.types.query;

import lua.Table;
import tarantool.util.Convert;
import tarantool.util.IManualConvert;

/**
 *  Query for update/upsert
 */
@:native("t.UpdateQuery")
class UpdateQuery<T> implements IManualConvert {

    /**
     *  Query value
     */
    var value : T;

    /**
     *  Field number
     */
    var fieldNum : Int;

    /**
     *  Get operator type
     *  Virtual
     *  @return OperatorType
     */
    function getOperator () : OperatorType {
        throw "Not implemented";
    }

    /**
     *  Convert query to raw tarantool query
     *  Virtual
     *  @return UpdateQueryRaw
     */
    function toRaw () : UpdateQueryRaw {
        return {
            operator : getOperator (),
            fieldNum : fieldNum,
            value : this.value
        };
    }

    /**
     *  Constructor
     *  @param fieldNum - 
     *  @param value - 
     */
    public function new (fieldNum : Int, value : T) {
        this.fieldNum = fieldNum;
        this.value = value;
    }    

    /**
     *  Calls from Convert to serialize to table. 
     *  For manual convert to table
     *  @return AnyTable
     */
    public function toTable () : AnyTable {
        return Convert.objectToTable (toRaw ());
    }
}
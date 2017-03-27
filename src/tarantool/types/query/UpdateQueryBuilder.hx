
package tarantool.types.query;

/**
 *  Compose update queries
 */
@:native("t.UpdateQueryBuilder")
class UpdateQueryBuilder {

    public static function start () : UpdateQueryBuilderObject {
        return new UpdateQueryBuilderObject ();
    }
}

/**
 *  For creating query
 */
@:native("t.UpdateQueryBuilderObject")
class UpdateQueryBuilderObject {

    /**
     *  Queries
     */
    private var query : Array<UpdateQuery<Dynamic>>;

    /**
     *  Constructor
     */
    public function new () {
        query = new Array<UpdateQuery<Dynamic>> ();
    }

    /**
     *  Add query
     */
    public function add (fieldNum : Int, value : Int) : UpdateQueryBuilderObject {
        query.push (new AddQuery (fieldNum, value));
        return this;
    }

    /**
     *  Substract query
     */
    public function substract (fieldNum : Int, value : Int) : UpdateQueryBuilderObject {
        query.push (new SubstractQuery (fieldNum, value));
        return this;
    }

    /**
     *  End build queries
     *  @return Array<UpdateQuery>
     */
    public function end () : Array<UpdateQuery<Dynamic>> {
        return query;
    }
}
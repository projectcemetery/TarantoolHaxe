
package platform.io.output;

/**
 *  Writeable for socket type objects
 */
interface ISocketOutput extends IByteWriteable 
                        extends ITextWriteable
                        extends ICloseable
{
}
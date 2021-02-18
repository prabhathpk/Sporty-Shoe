package in.co.fashion.store.exception;


public class DuplicateRecordException  extends Exception
{
	/**
	 * @param msg
	 *            error message
	 */
	public DuplicateRecordException(String msg) {
		super(msg);
	}
}

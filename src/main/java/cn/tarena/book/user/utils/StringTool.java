package cn.tarena.book.user.utils;

public class StringTool {

	public static boolean isEmpty(String str) {
		if ((str != null) && (str.length() > 0)) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean notEmpty(String str) {
		return !isEmpty(str);
	}

	/**
	 * 
	 * @param strs
	 * @return 当strs为null 或者 strs不包含任何元素时返回true
	 */
	public static boolean isEmpty(String[] strs) {
		if ((strs != null) && (strs.length > 0)) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 
	 * @param strs
	 * @return 当strs不为null 且 strs包含至少一个元素时返回true
	 */
	public static boolean notEmpty(String[] strs) {
		return !isEmpty(strs);
	}

}

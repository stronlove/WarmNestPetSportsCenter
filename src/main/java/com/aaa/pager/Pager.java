package com.aaa.pager;

import java.util.List;
/**
 * 分页工具类
 * @author Administrator
 *
 * @param <T>
 */
public class Pager<T> {

	//总条数
	private Long total;
	//每页显示多少条
    private Long pagesize=10L;
    //从第几条开始取
    private Long offset=0L;
    //当前页的数据
    private List<T>  rows;
    
    
    
    
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public Long getPagesize() {
		return pagesize;
	}
	public void setPagesize(Long pagesize) {
		this.pagesize = pagesize;
	}
	public Long getOffset() {
		return offset;
	}
	public void setOffset(Long offset) {
		this.offset = offset;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public static boolean isChinese(char c) {
        return c >= 0x4E00 &&  c <= 0x9FA5;// 根据字节码判断
    }
    // 判断一个字符串是否含有中文
    public static boolean isChinese(String str) {
        if (str == null) return false;
        for (char c : str.toCharArray()) {
            if (isChinese(c)) return false;// 有一个中文字符就返回
        }
        return true;
    }
    
    
}

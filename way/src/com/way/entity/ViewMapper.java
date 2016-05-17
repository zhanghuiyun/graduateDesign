package com.way.entity;

//接口实现
//T是泛型
//复制Bean属性
public interface ViewMapper<T,Y> {
	public T mapping(Y y);
}

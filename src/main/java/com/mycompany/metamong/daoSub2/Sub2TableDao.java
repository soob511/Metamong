package com.mycompany.metamong.daoSub2;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Sub2TableDao {

	public void CreateTable(String sql);

}

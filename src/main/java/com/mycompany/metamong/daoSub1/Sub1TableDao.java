package com.mycompany.metamong.daoSub1;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Sub1TableDao {

	public void CreateTable(String sql);

}

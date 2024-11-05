package com.mycompany.metamong.daoMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyCodeDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Mapper
public interface ApplyListDao {

	public List<ApplyCodeDto> selectApplyCodeList();

	public ApplyCodeDeatilDto selectCodeApplyDetail(int applyNo);

	public List<ApplyTableDto> selectApplyTableList(Pager pager);

/*	public List<ApplyTableDto> selectApplyTableSearch(@Param("form") Map<String, String> form,
			@Param("pager") Pager pager);*/

	public ApplyTableDeatilDto selectTableListDetail(int applyNo);

	public List<ApplyIndexListDto> selectApplyIndex();

	public List<ApplyIndexListDto> selectApplyIndexByParams(HashMap<String, Object> indexApplyListData);

	public ApplyIndexDetailDto selectApplyIndexDetail(int applyNo);

	public int insertApplyList(ApplyListDto apply);

	public int selectTotalRows();

	public int selectSearchRows(Map<String, String> form);

	public List<ApplyTableDto> selectApplyTableSearch(Map<String, Object> params);

}

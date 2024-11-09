package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface IndexDao {
	
	public List<IndexDto> selectIndex();
	
	public List<IndexDto> selectIndexByName(String indexName);
	
	public List<ApplyIndexListDto> selectApplyIndex(Pager Pager);
		
	public List<ApplyIndexListDto> selectApplyIndexByParamsPaging(
			@Param("schemaName") String schemaName,
			@Param("approvalStatus") int approvalStatus,
			@Param("indexName") String indexName,
			@Param("startRowNo") int startRowNo,
			@Param("endRowNo") int endRowNo
			);

	public ApplyIndexDetailDto selectApplyIndexDetail(int applyNo);
	
	public int selectTotalRows();

	public int selectIndexRows(
			@Param("schemaName") String schemaName,
			@Param("approvalStatus") int approvalStatus,
			@Param("indexName") String indexName
			);
	
	public int insertApplyIndex(ApplyIndexDto applyIndexDto);
	
}

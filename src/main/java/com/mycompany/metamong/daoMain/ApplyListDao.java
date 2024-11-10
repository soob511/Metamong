package com.mycompany.metamong.daoMain;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyCodeDetailDto;
import com.mycompany.metamong.dto.applyList.ApplyCodeListDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyTableListDto;
import com.mycompany.metamong.dto.applyList.ApprovalStatusCountDto;
import com.mycompany.metamong.dto.applyList.DbObjApprovalStatusDto;
import com.mycompany.metamong.dto.sequence.SequenceApplyListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Mapper
public interface ApplyListDao {
	
	public int selectApplyCodeRows();

	public List<ApplyCodeListDto> selectApplyCodeList(Pager pager);

	public int selectApplyCodeSearchRows(@Param("status") int status, @Param("option") String option, @Param("keyword") String keyword);
	
	public List<ApplyCodeListDto> selectApplyCodeSearchList(@Param("status") int status, @Param("option") String option, @Param("keyword") String keyword, @Param("pager") Pager pager);
	
	public ApplyCodeDetailDto selectCodeApplyDetail(int applyNo);

	public List<ApplyTableListDto> selectApplyTableList(Pager pager);

	public ApplyTableDeatilDto selectTableListDetail(int applyNo);

	public int insertApplyList(ApplyListDto apply);

	public int selectTotalRows();

	public int updateCodeStatus(Map<String, Object> params);

	public int selectSearchRows(Map<String, String> form);

	public List<ApplyTableDto> selectApplyTableSearch(Map<String, Object> params);
	
	public int updateProcessApproval(ApplyListDto applyList);
	
	public String selectApplyType(int applyNo);

	public String getSchemaName(int applyNo);

	public String getQuery(int applyNo);

	public int updateStatus(@Param("applyNo")int applyNo,@Param("status") int status);

	public int updateRejectReason(@Param("applyNo")int applyNo,@Param("message") String message);

	public int insertApplySequence(ApplyListDto applyList);

	public int selectTotalSequenceRows();

	public List<SequenceApplyListDto> selectSequenceApplyList(Pager pager);

	public int selectSequenceSearchRows(Map<String, String> form);

	public List<SequenceApplyListDto> selectApplySequenceSearch(Map<String, Object> params);
	
	public List<ApprovalStatusCountDto> selectApprovalStatus(String mId);
	
	public List<DbObjApprovalStatusDto> selectDbObjApprovalStatus();
}

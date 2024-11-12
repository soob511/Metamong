package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoHr.HrColumnDao;
import com.mycompany.metamong.daoHr.HrIndexDao;
import com.mycompany.metamong.daoHr.HrSequenceDao;
import com.mycompany.metamong.daoHr.HrTableDao;
import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.daoPms.PmsColumnDao;
import com.mycompany.metamong.daoPms.PmsSequenceDao;
import com.mycompany.metamong.daoPms.PmsTableDao;
import com.mycompany.metamong.daoPms.PmsIndexDao;
import com.mycompany.metamong.daoSrm.SrmColumnDao;
import com.mycompany.metamong.daoSrm.SrmSequenceDao;
import com.mycompany.metamong.daoSrm.SrmTableDao;
import com.mycompany.metamong.daoSrm.SrmIndexDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyCodeDetailDto;
import com.mycompany.metamong.dto.applyList.ApplyCodeListDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyTableListDto;
import com.mycompany.metamong.dto.applyList.ApprovalStatusCountDto;
import com.mycompany.metamong.dto.applyList.ApprovalStatusDto;
import com.mycompany.metamong.dto.applyList.DbObjApprovalStatusDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeApplyDto;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnAddDto;
import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemApplyDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.dto.sequence.SequenceApplyListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableAddDto;
import com.mycompany.metamong.dto.table.TableDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApplyService {
	@Autowired
	private ApplyListDao applyListDao;
	@Autowired
	private CodeDao codeDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private TableDao tableDao;
	@Autowired
	private ColumnDao columnDao;
	@Autowired
	private SrmTableDao srmTableDao;
	@Autowired
	private PmsTableDao pmsTableDao;
	@Autowired
	private HrTableDao hrTableDao;
	@Autowired
	private SrmColumnDao srmColumnDao;
	@Autowired
	private PmsColumnDao pmsColumnDao;
	@Autowired
	private HrColumnDao hrColumnDao;
	@Autowired
	private SrmSequenceDao srmSequenceDao;
	@Autowired
	private PmsSequenceDao pmsSequenceDao;
	@Autowired
	private HrSequenceDao hrSequenceDao;
	@Autowired
	private SrmIndexDao sub1IndexDao;
	@Autowired
	private PmsIndexDao sub2IndexDao;
	@Autowired
	private HrIndexDao sub3IndexDao;

	public int getApplyCodeRows() {
		return applyListDao.selectApplyCodeRows();
	}

	public List<ApplyCodeListDto> getApplyCodeList(Pager pager) {
		return applyListDao.selectApplyCodeList(pager);
	}

	public int getApplyCodeSearchRows(int status, String option, String keyword) {
		return applyListDao.selectApplyCodeSearchRows(status, option, keyword);
	}

	public List<ApplyCodeListDto> getApplyCodeSearchList(int status, String option, String keyword, Pager pager) {
		return applyListDao.selectApplyCodeSearchList(status, option, keyword, pager);
	}

	public ApplyCodeDetailDto getCodeApplyDetail(int applyNo) {
		return applyListDao.selectCodeApplyDetail(applyNo);
	}

	public List<CodeDto> getCodeApplyByNo(int applyNo) {
		return codeDao.selectCodeApplyByNo(applyNo);
	}

	public List<ItemDto> getItemsApplyByNo(int applyNo) {
		return itemDao.selectItemsByNo(applyNo);
	}

	public List<ApplyItemDto> getApplyItemsByNo(int applyNo) {
		return itemDao.selectApplyItemsByNo(applyNo);
	}

	public List<ItemDto> getItemsApplyExcelByNo(int applyNo, int codeNo) {
		return itemDao.selectItemsExcelByNo(applyNo, codeNo);
	}

	public List<ApplyTableListDto> getApplyTableList(Pager pager) {
		return applyListDao.selectApplyTableList(pager);
	}

	public ApplyTableDeatilDto getTableListDetail(int applyNo) {
		return applyListDao.selectTableListDetail(applyNo);
	}

	public void addApplyList(ApplyListDto apply) {
		applyListDao.insertApplyList(apply);
	}

	@Transactional
	public int addApplyCode(CodeApplyDto form, Authentication auth, int applyNo) {
		int applyId = 0;

		if (applyNo == 0) {
			ApplyListDto apply = new ApplyListDto();
			apply.setMId(auth.getName());
			apply.setApplyReason(form.getApplyReason());
			apply.setApplyObj("CODE");
			apply.setApplyType(form.getApplyType());
			applyListDao.insertApplyList(apply);
			applyNo = apply.getApplyNo();
			applyId = applyNo;
		}

		ApplyCodeDto code = new ApplyCodeDto();
		code.setApplyNo(applyNo);
		code.setCodeNo(form.getCodeNo());
		code.setCodeId(form.getCodeId());
		code.setCodeNm(form.getCodeNm());
		code.setCodeLength(form.getCodeLength());
		code.setCodeContent(form.getCodeContent());
		code.setCodeIsActive(form.getCodeIsActive());
		codeDao.insertApplyCode(code);

		List<ItemApplyDto> items = form.getItems();
		for (ItemApplyDto i : items) {
			ApplyItemDto item = new ApplyItemDto();
			item.setApplyNo(applyNo);
			item.setItemId(i.getItemId());
			item.setItemNm(i.getItemNm());
			item.setItemContent(i.getItemContent());
			item.setItemIsActive(i.getItemIsActive());
			item.setItemIsUpdate(i.getItemIsUpdate());
			item.setCodeNo(code.getCodeNo());
			itemDao.insertApplyItem(item);
		}
		return applyId;
	}

	@Transactional
	public void addApplyIndex(ApplyListDto applyListDto, ApplyIndexDto applyIndexDto) {
		applyListDao.insertApplyList(applyListDto);
		applyIndexDto.setApplyNo(applyListDto.getApplyNo());
		indexDao.insertApplyIndex(applyIndexDto);
	}

	public List<ApplyIndexListDto> getApplyIndexList(Pager pager) {
		return indexDao.selectApplyIndex(pager);
	}

	public List<ApplyIndexListDto> getApplyIndexList(String schemaName, int approvalStatus, String indexName,
			int startRowNo, int endRowNo) {
		List<ApplyIndexListDto> list = indexDao.selectApplyIndexByParamsPaging(schemaName, approvalStatus, indexName,
				startRowNo, endRowNo);
		return list;
	}

	public ApplyIndexDetailDto getApplyIndexListDetail(int applyNo) {
		return indexDao.selectApplyIndexDetail(applyNo);
	}

	@Transactional
	public void addApplyTable(TableAddDto form, Authentication auth) {

		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setSchemaName(form.getSchemaName());
		applyList.setApplyReason(form.getApplyReason());
		applyList.setApplyObj("TABLE");
		applyList.setApplyType(form.getApplyType());
		applyListDao.insertApplyList(applyList);

		ApplyTableDto applyTable = new ApplyTableDto();
		applyTable.setApplyNo(applyList.getApplyNo());
		applyTable.setTableNm(form.getTableNm());
		applyTable.setTableId(form.getTableId());
		applyTable.setTableContent(form.getTableContent());

		if (form.getApplyType().equals("CREATE")) {
			tableDao.insertApplyTable(applyTable);
		} else {
			applyTable.setTableNo(form.getTableNo());
			tableDao.insertApplyTableByTableNo(applyTable);
		}

		List<ColumnAddDto> list = form.getColumns();
		ApplyColumnDto applyColumn = new ApplyColumnDto();

		int order = 0;
		for (ColumnAddDto column : list) {
			order += 1;
			applyColumn.setApplyNo(applyList.getApplyNo());
			applyColumn.setColId(column.getColId());
			applyColumn.setColNm(column.getColNm());
			applyColumn.setDataType(column.getDataType());
			applyColumn.setColLength(column.getColLength());
			applyColumn.setColIsnullable("NOTNULL".equals(column.getColNullable()) ? 0 : 1);
			applyColumn.setColIspk("N".equals(column.getColPk()) ? 0 : 1);
			applyColumn.setColOrder(order);
			if (column.getColIsupdate() == 1) {
				applyColumn.setColIsupdate(1);
			} else if (column.getColIsupdate() == 2) {
				applyColumn.setColIsupdate(2);
			} else {
				applyColumn.setColIsupdate(0);
			}

			columnDao.insertApplyColumn(applyColumn);
		}

	}

	public int getTotalRows() {
		return applyListDao.selectTotalRows();
	}

	public void updateCodeStatus(Map<String, Object> params) {
		applyListDao.updateCodeStatus(params);
	}

	public int getSearchRows(Map<String, String> form) {
		return applyListDao.selectSearchRows(form);
	}

	public List<ApplyTableDto> getApplyTableSearch(Map<String, Object> params) {
		return applyListDao.selectApplyTableSearch(params);
	}

	public void addProcessApproval(ApplyListDto applyList) {
		applyListDao.updateProcessApproval(applyList);
	}

	public String getApplyType(int applyNo) {
		return applyListDao.selectApplyType(applyNo);
	}

	public String addCreateTableSql(int applyNo, String type) {
		StringBuilder sql = new StringBuilder();

		String tableId = tableDao.selectTableIdByApplyNo(applyNo);
		String schema = applyListDao.getSchemaName(applyNo);

		if (type.equals("UPDATE")) {
			String tempTableName = String.format("TMP_%s_%d", tableId, applyNo);

			sql.append("CREATE TABLE ").append(tempTableName).append(" AS SELECT * FROM ");

			if (schema.equals("SRM")) {
				sql.append("USER_2024_OTI_FINAL_TEAM1_1.");
			} else if (schema.equals("PMS")) {
				sql.append("USER_2024_OTI_FINAL_TEAM1_2.");
			} else {
				sql.append("USER_2024_OTI_FINAL_TEAM1_3.");
			}

			sql.append(tableId).append(";\n");

			sql.append(String.format("DROP TABLE %s;\n", tableId));
		}

		sql.append("CREATE TABLE ").append(tableId).append(" (");

		List<ColumnDto> list = columnDao.selectColumnByApplyNo(applyNo);
		List<String> columns = new ArrayList<>();
		StringBuilder pksql = new StringBuilder(", CONSTRAINT ").append(tableId).append("_PK PRIMARY KEY (");
		boolean firstPk = true;

		for (ColumnDto column : list) {
			StringBuilder col = new StringBuilder(column.getColId()).append(" ").append(column.getDataType());

			if (column.getColLength() != null) {
				col.append("(").append(column.getColLength()).append(")");
			}

			if (column.getColIspk() == 1) {
				if (!firstPk) {
					pksql.append(", ");
				}
				pksql.append(column.getColId());
				firstPk = false;
			} else {
				col.append(column.getColIsnullable() == 1 ? " NULL" : " NOT NULL");
			}

			columns.add(col.toString());
		}

		sql.append(String.join(", ", columns));
		pksql.append(")");

		sql.append(pksql);
		sql.append(")\n");

		return sql.toString();
	}

	@Transactional
	public int runQuery(int applyNo, String type) {
		int pass = -1;
		try {
			String schema = applyListDao.getSchemaName(applyNo);
			String sql = applyListDao.getQuery(applyNo);

			if (type.equals("CREATE")) {
				if (schema.equals("SRM")) {
					pass = srmTableDao.CreateTable(sql);
				} else if (schema.equals("PMS")) {
					pass = pmsTableDao.CreateTable(sql);
				} else {
					pass = hrTableDao.CreateTable(sql);
				}
			} else {
				String[] updateSql = Arrays.stream(sql.split(";")).map(String::trim).toArray(String[]::new);

				if (schema.equals("SRM")) {
					for (String usql : updateSql) {
						pass = srmColumnDao.updateColumn(usql);
						if (pass != 0)
							break;
					}
				} else if (schema.equals("PMS")) {
					for (String usql : updateSql) {
						pass = pmsColumnDao.updateColumn(usql);
						if (pass != 0)
							break;
					}
				} else {
					for (String usql : updateSql) {
						pass = hrColumnDao.updateColumn(usql);
						if (pass != 0)
							break;
					}
				}
			}

			// 성공했을시
			if (pass == 0) {
				TableDto table = tableDao.selectApplyTable(applyNo);
				if (type.equals("CREATE")) {
					applyListDao.updateStatus(applyNo, 3);
					table.setSchemaNm(schema);
					tableDao.insertTable(table);

					List<ColumnDto> column = columnDao.selectApplyColumn(applyNo);
					for (ColumnDto col : column) {
						col.setTableNo(table.getTableNo());
						columnDao.insertColumn(col);
					}
				} else {
					applyListDao.updateStatus(applyNo, 3);
					List<ColumnDto> precolumn = columnDao.selectColumnBytableNo(table.getTableNo());
					for (ColumnDto col : precolumn) {
						col.setTableNo(table.getTableNo());
						columnDao.deleteColumn(col);
					}

					List<ColumnDto> column = columnDao.selectApplyColumn(applyNo);
					for (ColumnDto col : column) {
						col.setTableNo(table.getTableNo());
						columnDao.insertColumn(col);
					}

				}
			} else { // 실패했을때
				applyListDao.updateStatus(applyNo, 2);
				applyListDao.updateRejectReason(applyNo, "반영시 오류가 있습니다.");
			}
		} catch (

		Exception e) {
			applyListDao.updateStatus(applyNo, 2);
			applyListDao.updateRejectReason(applyNo, "반영시 오류가 있습니다.");
			e.printStackTrace();
			pass = -1;
		}

		return pass;
	}

	public void applySequence(ApplyListDto applyList) {
		applyListDao.insertApplySequence(applyList);
	}

	public String createIndexSql(ApplyIndexDetailDto applyDetail) {
		String unique = applyDetail.getIsUnique() == 1 ? "UNIQUE " : "";
		String applyType = applyDetail.getApplyType().toUpperCase();
		String query = "";
		if ("CREATE".equals(applyType)) {
			query = String.format("%s %sINDEX %s ON %s (%s)", applyType, unique, applyDetail.getIdxName(),
					applyDetail.getTableId(), applyDetail.getRefColumn());
		} else {
			query = String.format("DROP INDEX %s", applyDetail.getIdxName());
		}
		return query;
	}

	public int getTotalSequenceRows() {
		int totalRows = applyListDao.selectTotalSequenceRows();
		return totalRows;
	}

	public List<SequenceApplyListDto> getsequenceApplyList(Pager pager) {
		List<SequenceApplyListDto> list = applyListDao.selectSequenceApplyList(pager);
		return list;
	}

	public int getSequenceSearchRows(Map<String, String> form) {
		return applyListDao.selectSequenceSearchRows(form);
	}

	public List<SequenceApplyListDto> getApplySequenceSearch(Map<String, Object> params) {
		return applyListDao.selectApplySequenceSearch(params);
	}

	public int sequenceRunQuery(int applyNo) {
		String schema = applyListDao.getSchemaName(applyNo);
		String sql = applyListDao.getQuery(applyNo);
		int pass = -1;

		try {
			if (schema.equals("SRM")) {
				pass = srmSequenceDao.createSequence(sql);
			} else if (schema.equals("PMS")) {
				pass = pmsSequenceDao.createSequence(sql);
			} else {
				pass = hrSequenceDao.createSequence(sql);
			}

			if (pass != 0) {
				throw new Exception("쿼리 실행에 실패했습니다.");
			} else {
				applyListDao.updateStatus(applyNo, 3);
			}

		} catch (Exception e) {
			applyListDao.updateStatus(applyNo, 2);
			applyListDao.updateRejectReason(applyNo, "반영 시 오류가 있습니다");
			e.printStackTrace();
		}

		return pass;
	}

	public void applyIndexSql(String schemaName, int applyNo, String dbaName) {
		String query = applyListDao.getQuery(applyNo);
		ApplyListDto applyList = new ApplyListDto();
		applyList.setApplyNo(applyNo);
		applyList.setDbaName(dbaName);
		log.info("실행" + query);
		try {
			switch (schemaName) {
			case "SRM":
				sub1IndexDao.createIndex(query);
				break;
			case "PMS":
				sub2IndexDao.createIndex(query);
				break;
			case "HR":
				sub3IndexDao.createIndex(query);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			applyList.setApprovalStatus(2);
			applyList.setRejectReason("반영할 수 없는 신청입니다");
			applyListDao.updateProcessApproval(applyList);
			throw new RuntimeException("오류 발생");
		}
		applyList.setApprovalStatus(3);
		applyListDao.updateProcessApproval(applyList);
	}

	public ApprovalStatusDto countApprovalStatus(String mId) {
		List<ApprovalStatusCountDto> approvalStatusCount = applyListDao.selectApprovalStatus(mId);
		ApprovalStatusDto approvalStatus = new ApprovalStatusDto();

		for (ApprovalStatusCountDto status : approvalStatusCount) {
			switch (status.getApprovalStatus()) {
			case 0:
				approvalStatus.setAwaitCount(status.getCount());
				break;
			case 1:
				approvalStatus.setApprovedCount(status.getCount());
				break;
			case 2:
				approvalStatus.setRejectedCount(status.getCount());
				break;
			case 3:
				approvalStatus.setReflectCount(status.getCount());
				break;
			}
		}
		return approvalStatus;
	}

	public List<DbObjApprovalStatusDto> getDbObjAwaitStatus() {
		return applyListDao.selectDbObjApprovalStatus();
	}

	public void resetComplDate(int applyNo) {
		applyListDao.updateComplDate(applyNo);
	}

	public void updateRollbackApply(int applyNo) {
		applyListDao.updateRollbackApply(applyNo);
	}
}

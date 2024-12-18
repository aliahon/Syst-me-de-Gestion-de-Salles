package metier.entities;

import java.time.LocalDateTime;

import javax.persistence.*;

@Entity
@Table(name = "journalisation")
public class Journalisation {
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Column(name = "table_name")
	    private String tableName;

	    @Column(name = "operation_type")
	    private String operationType;

	    @Column(name = "record_id")
	    private String recordId;

	    @Column(name = "operation_time")
	    private LocalDateTime operationTime;

	    @Column(name = "details")
	    private String details;

		public String getDetails() {
			return details;
		}

		public void setDetails(String details) {
			this.details = details;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getTableName() {
			return tableName;
		}

		public void setTableName(String tableName) {
			this.tableName = tableName;
		}

		public String getOperationType() {
			return operationType;
		}

		public void setOperationType(String operationType) {
			this.operationType = operationType;
		}

		public String getRecordId() {
			return recordId;
		}

		public void setRecordId(String recordId) {
			this.recordId = recordId;
		}

		public LocalDateTime getOperationTime() {
			return operationTime;
		}

		public void setOperationTime(LocalDateTime operationTime) {
			this.operationTime = operationTime;
		}

	  

}

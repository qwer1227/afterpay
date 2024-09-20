package com.jhta.afterpay.util;

public class Pagination {
<<<<<<< Updated upstream
    private final int rowsPerPage;
    private final int pagesPerPage;
    private final int pageNo;
    private final int totalRows;

    public Pagination(int pageNo, int totalRows) {
        this.rowsPerPage = 10;
        this.pagesPerPage = 5;
        this.pageNo = pageNo;
        this.totalRows = totalRows;
    }

    public Pagination(int pageNo, int totalRows, int rows) {
        this.rowsPerPage = rows;
        this.pagesPerPage = 5;
        this.pageNo = pageNo;
        this.totalRows = totalRows;
    }

    public Pagination(int pageNo, int totalRows, int rows, int pages) {
        this.rowsPerPage = rows;
        this.pagesPerPage = pages;
        this.pageNo = pageNo;
        this.totalRows = totalRows;
    }

    /**
     * 총 데이터 갯수를 반환
     * @return 총 데이터갯수
     */
    public int getTotalRows() {
        return totalRows;
    }

    /**
     * 총 페이지 갯수를 반환
     * @return 총 페이지 갯수
     */
    public int getTotalPages() {
        return Utils.ceil(totalRows, rowsPerPage);
    }

    /**
     * 총 페이지 블록번호를 반환
     * @return 총 페이지 블록번호
     */
    public int getTotalPageBlocks() {
        return Utils.ceil(getTotalPages(), pagesPerPage);
    }

    /**
     * 현재 페이지번호가 속한 페이지 블록번호를 반환
     * @return 현재 페이지 블록번호
     */
    public int getCurrentPageBlock() {
        return Utils.ceil(pageNo, pagesPerPage);
    }

    /**
     * 현재 페이저번호에 맞는 페이지 내비게이션의 시작번호를 반환
     * @return 페이지 시작번호
     */
    public int getBeginPage() {
        return (getCurrentPageBlock() - 1) * pagesPerPage + 1;
    }

    /**
     * 현재 페이지번호에 맞는 페이지 내비게이션의 끝 페이지번호를 반환
     * @return 페이지 끝번호
     */
    public int getEndPage() {
        return getCurrentPageBlock() == getTotalPageBlocks() ?
                getTotalPages() : getCurrentPageBlock() * pagesPerPage;
    }

    /**
     * 현재 페이지번호에 맞는 조회범위의 하한값을 반환
     * @return 조회범위 시작값
     */
    public int getBegin() {
        return (pageNo - 1) * rowsPerPage + 1;
    }

    /**
     * 현재 페이지번호에 맞는 조회범위의 상한값을 반환
     * @return 조회범위 끝값
     */
    public int getEnd() {
        return pageNo * rowsPerPage;
    }

    /**
     * 현재 페이지가 첫번째 페이지인지 여부를 반환
     * @return 현재 페이지가 첫번째 페이지이면 true를 반환
     */
    public boolean isFirst() {
        return pageNo <= 1;
    }

    /**
     * 현재 페이지가 마지막페이지인지 여부를 반환
     * @return 마지막 페이지이면 true를 반환
     */
    public boolean isLast() {
        return pageNo >= getTotalPages();
    }

    /**
     * 현재 페이지의 이전 페이지번호를 반환
     * @return 이전 페이지번호
     */
    public int getPrev() {
        return pageNo - 1;
    }

    /**
     * 현재 페이지의 다음 페이지번호를 반환
     * @return 다음 페이지번호
     */
    public int getNext() {
        return pageNo + 1;
    }
}

=======
	private final int rowsPerPage;
	private final int pagesPerPage;
	private final int pageNo;
	private final int totalRows;

	public Pagination(int pageNo, int totalRows) {
		this.rowsPerPage = 10;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	public Pagination(int pageNo, int totalRows, int rows) {
		this.rowsPerPage = rows;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	public Pagination(int pageNo, int totalRows, int rows, int pages) {
		this.rowsPerPage = rows;
		this.pagesPerPage = pages;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	/**
	 * 총 데이터 갯수를 반환
	 *
	 * @return 총 데이터갯수
	 */
	public int getTotalRows() {
		return totalRows;
	}

	/**
	 * 총 페이지 갯수를 반환
	 *
	 * @return 총 페이지 갯수
	 */
	public int getTotalPages() {
		return Utils.ceil(totalRows, rowsPerPage);
	}

	/**
	 * 총 페이지 블록번호를 반환
	 *
	 * @return 총 페이지 블록번호
	 */
	public int getTotalPageBlocks() {
		return Utils.ceil(getTotalPages(), pagesPerPage);
	}

	/**
	 * 현재 페이지번호가 속한 페이지 블록번호를 반환
	 *
	 * @return 현재 페이지 블록번호
	 */
	public int getCurrentPageBlock() {
		return Utils.ceil(pageNo, pagesPerPage);
	}

	/**
	 * 현재 페이저번호에 맞는 페이지 내비게이션의 시작번호를 반환
	 *
	 * @return 페이지 시작번호
	 */
	public int getBeginPage() {
		return (getCurrentPageBlock() - 1) * pagesPerPage + 1;
	}

	/**
	 * 현재 페이지번호에 맞는 페이지 내비게이션의 끝 페이지번호를 반환
	 *
	 * @return 페이지 끝번호
	 */
	public int getEndPage() {
		return getCurrentPageBlock() == getTotalPageBlocks() ?
				getTotalPages() : getCurrentPageBlock() * pagesPerPage;
	}

	/**
	 * 현재 페이지번호에 맞는 조회범위의 하한값을 반환
	 *
	 * @return 조회범위 시작값
	 */
	public int getBegin() {
		return (pageNo - 1) * rowsPerPage + 1;
	}

	/**
	 * 현재 페이지번호에 맞는 조회범위의 상한값을 반환
	 *
	 * @return 조회범위 끝값
	 */
	public int getEnd() {
		return pageNo * rowsPerPage;
	}

	/**
	 * 현재 페이지가 첫번째 페이지인지 여부를 반환
	 *
	 * @return 현재 페이지가 첫번째 페이지이면 true를 반환
	 */
	public boolean isFirst() {
		return pageNo <= 1;
	}

	/**
	 * 현재 페이지가 마지막페이지인지 여부를 반환
	 *
	 * @return 마지막 페이지이면 true를 반환
	 */
	public boolean isLast() {
		return pageNo >= getTotalPages();
	}

	/**
	 * 현재 페이지의 이전 페이지번호를 반환
	 *
	 * @return 이전 페이지번호
	 */
	public int getPrev() {
		return pageNo - 1;
	}

	/**
	 * 현재 페이지의 다음 페이지번호를 반환
	 *
	 * @return 다음 페이지번호
	 */
	public int getNext() {
		return pageNo + 1;
	}
}
>>>>>>> Stashed changes

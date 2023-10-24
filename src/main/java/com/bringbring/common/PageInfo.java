package com.bringbring.common;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class PageInfo {
    private int currentPage;
    private int totalCount;
    private int naviTotalCount;
    private int recordCountPerPage;
    private int naviCountPerPage;
    private int startNavi;
    private int endNavi;

    public PageInfo(int currentPage, int totalCount, int naviTotalCount, int recordCountPerPage, int naviCountPerPage,
                    int startNavi, int endNavi) {
        super();
        this.currentPage = currentPage;
        this.totalCount = totalCount;
        this.naviTotalCount = naviTotalCount;
        this.recordCountPerPage = recordCountPerPage;
        this.naviCountPerPage = naviCountPerPage;
        this.startNavi = startNavi;
        this.endNavi = endNavi;

    }

}

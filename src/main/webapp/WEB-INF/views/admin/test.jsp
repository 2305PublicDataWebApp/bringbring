<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<h1>대한민국 서울의 날씨 정보</h1>
<!-- 날씨 -->
<section class="weather">
    <div class="container mt-5" data-aos="fade-up">
        <div class="section-title">
            <h2>날씨 서비스</h2>
            <p>커스텀해서 쓰면될 듯</p>
        </div>
        <div id="weatherCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <!-- 날씨 정보는 여기에 동적으로 추가될 것입니다. -->
            </div>
            <button class="carousel-control-prev " type="button" data-bs-target="#weatherCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">이전</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#weatherCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">다음</span>
            </button>
        </div>
    </div>
</section>
<script>
    $(document).ready(function() {
        var today = new Date();
        var year = today.getFullYear();
        var month = (today.getMonth() + 1).toString().padStart(2, '0');
        var day = today.getDate().toString().padStart(2, '0');
        var hours = today.getHours().toString().padStart(2, '0');

        var korea = [
            {'region' : '서울','nx' : 60,'ny' : 127},
            {'region' : '인천','nx' : 55,'ny' : 124},
            {'region' : '경기도','nx' : 60,'ny' : 121},
            {'region' : '강원도','nx' : 92,'ny' : 131},
            {'region' : '충청북도','nx' : 69,'ny' : 106},
            {'region' : '충청남도','nx' : 68,'ny' : 100},
            {'region' : '전라북도','nx' : 63,'ny' : 89},
            {'region' : '전라남도','nx' : 50,'ny' : 67},
            {'region' : '경상남도','nx' : 90,'ny' : 77},
            {'region' : '경상북도','nx' : 91,'ny' : 106},
            {'region' : '제주도','nx' : 52,'ny' : 38} ];

        var apikey = "uy3jYbeNo9pdYLz%2FbZXRO%2F3tFw9FcY6FjN1mlzXiPnfDm4yy4z4ceuYU2ValrUULBJVlrX6JBznSjobmLH1A7w%3D%3D"; // 여기에 본인의 API 키를 넣어주세요.

        $.each(korea, function(j, k) {
            var _nx = k.nx, _ny = k.ny, region = k.region;

            var ForecastGribURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
            ForecastGribURL += "?ServiceKey=" + apikey;
            ForecastGribURL += "&base_date=" + year + month + day;
            ForecastGribURL += "&base_time=" + hours + "00";
            ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;

            $.ajax({
                url: ForecastGribURL,
                type: 'GET',
                success: function(data) {
                    var $data = $(data).find("response>body>items>item");
                    var temp = '';
                    var rain = '';
                    var skyValue = '';
                    var ptyValue = '';
                    var rainAmount = '';
                    var rainProbability = '';
                    $.each($data, function(i, o) {
                        var category = $(o).find("category").text();
                        var fcstValue = $(o).find("fcstValue").text();

                        if (category === 'TMP') {
                            temp = fcstValue;
                        } else if (category === 'SKY') {
                            skyValue = parseInt(fcstValue);
                        } else if (category === 'PTY') {
                            ptyValue = parseInt(fcstValue);
                        } else if (category === 'RN1') {
                            rainAmount = fcstValue; // 강수량 (mm)
                        } else if (category === 'POP') {
                            rainProbability = fcstValue; // 강수확률 (%)
                        }
                    });

                    // SKY 값과 PTY 값을 기반으로 아이콘 클래스 결정
                    var iconClass = '';
                    if (ptyValue === 0) {
                        switch (skyValue) {
                            case 1:
                                iconClass = 'bi-sun'; // 맑음
                                break;
                            case 2:
                                iconClass = 'bi-cloud-sun'; // 구름조금
                                break;
                            case 3:
                                iconClass = 'bi-cloud'; // 구름많음
                                break;
                            case 4:
                                iconClass = 'bi-cloudy'; // 흐림
                                break;
                            default:
                                iconClass = 'bi-question'; // 알 수 없는 날씨 상태에 대한 기본 아이콘
                        }
                    } else if (ptyValue === 1 || ptyValue === 2) {
                        iconClass = 'bi-cloud-rain'; // 비
                    } else if (ptyValue === 3) {
                        iconClass = 'bi-snow'; // 눈
                    }

                    var weatherInfo = '<div class="carousel-item" style="padding: 20px;">';
                    weatherInfo += '<i class="bi ' + iconClass + '"></i>'; // 아이콘 추가 부분
                    weatherInfo += '<h2>' + region + '</h2>';
                    weatherInfo += '<p>온도: ' + temp + ' ℃</p>';
                    weatherInfo += '<p>강수량: ' + rainAmount + ' mm</p>';
                    weatherInfo += '<p>강수확률: ' + rainProbability + ' %</p>';
                    weatherInfo += '</div>';

                    if (j === 0) {
                        weatherInfo = '<div class="carousel-item active" style="padding: 20px;">' + weatherInfo;
                    }

                    $('#weatherCarousel .carousel-inner').append(weatherInfo);
                }
            });
        });
    });
</script>
</body>
</html>

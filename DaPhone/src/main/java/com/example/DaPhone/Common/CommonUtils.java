package com.example.DaPhone.Common;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.YearMonth;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Component
public class CommonUtils {
	@Value("${privatekey_string}")
	private String PRIVATEKEY_STRING;
	@Value("${publickey_string}")
	private String PUBLICKEY_STRING;

	public String createToken(String userId, String username, String authRequestID) throws Exception {
		byte[] privateKeyBytes = Base64.getDecoder().decode(PRIVATEKEY_STRING);
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
		KeyFactory kf = KeyFactory.getInstance("RSA");
		PrivateKey privKey = kf.generatePrivate(keySpec);
		if (authRequestID != null) {
			JwtBuilder jwtBuilder = Jwts.builder().setSubject(username).setId(authRequestID)
					.claim("tokenType", "register")
					.setExpiration(Date.from(ZonedDateTime.now().plusMinutes(1440).toInstant()));
			return jwtBuilder.signWith(privKey).compact();
		}
		return null;
	}

	public UserDetailPrincipal getUserInfo(String jwtToken) throws Exception {
		byte[] publicKeyBytes = Base64.getDecoder().decode(PUBLICKEY_STRING);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
		KeyFactory kf = KeyFactory.getInstance("RSA");
		PublicKey publicKey = kf.generatePublic(keySpec);
		Jws<Claims> jws = Jwts.parser().setSigningKey(publicKey).parseClaimsJws(jwtToken);
		UserDetailPrincipal userDetail = new UserDetailPrincipal();
		Claims claims = jws.getBody();
		userDetail.setId(claims.getId());
		userDetail.setUsername(claims.getSubject());
		String tokenType = claims.get("tokenType", String.class);
		if (tokenType.equalsIgnoreCase("register")) {
			userDetail.setAuthenticated(true);
		} else {
			userDetail.setAuthenticated(false);
		}
		return userDetail;
	}

	public KeyPair createNewKeyPair() {
		return Keys.keyPairFor(SignatureAlgorithm.RS256);
	}

	public class UserDetailPrincipal {
		private String id;
		private String username;
		private boolean authenticated;

		public boolean isAuthenticated() {
			return authenticated;
		}

		public void setAuthenticated(boolean authenticated) {
			this.authenticated = authenticated;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}
	}



	public static String StringFormatDate(Date sdate, String toDate) {
		Date date = sdate;
		SimpleDateFormat formatter = new SimpleDateFormat(toDate);
		return formatter.format(date);
	}


	
	public static Map<String, List<Date>> getWeeksOfMonth(){
		List<Date> listDateOfMonth = new ArrayList<Date>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int myMonth = cal.get(Calendar.MONTH);
		while (myMonth == cal.get(Calendar.MONTH)) {
			listDateOfMonth.add(cal.getTime());
			cal.add(Calendar.DAY_OF_MONTH, 1);
		}
		int from = 1;
		int to = 7;
		Map<String, List<Date>> weekOfMonth = new HashMap<String, List<Date>>();
		for (int i = 1; i <= (listDateOfMonth.size() / 7); i++) {
			List<Date> dates = new ArrayList<Date>();
			dates.add(listDateOfMonth.get(from - 1));
			dates.add(listDateOfMonth.get(to - 1));
			weekOfMonth.put("Week" + i, dates);
			from += 7;
			to = 7 * (i + 1);
		}
		List<Date> otherDates = new ArrayList<Date>();
		for (int j = from; j <= listDateOfMonth.size(); j++) {
			otherDates.add(listDateOfMonth.get(j-1));
			weekOfMonth.put("Week" + ((listDateOfMonth.size() / 7)+1), otherDates);	
		}
		return weekOfMonth;
	}
	// response exception
		public static final String GIUPVIEC_HVT = "GIUPVIEC_HVT";
		public static final Long LOGIN_FAIL = 1L;
		public static final String PROCESS = "Process";
		public static final String DELIVERY = "Delivery";
		public static final String DELIVERED = "Delivered";
		public static final String CANCEL = "Cancel";
		public static final Long LOGIN_SUCCESS = 0L;
		public static final String ROOT_IMAGES_BACKEND = "D:/Linh_tinh/work-to-do/ki 2 nam 4/DoAnTotNghiep/do_an_code/be/src/assets/images/";
		public static final String ROOT_IMAGES_FRONTEND = "D:/Linh_tinh/work-to-do/ki 2 nam 4/DoAnTotNghiep/do_an_code/fe/src/assets/images/";

		public enum ChucNang {
			TT_QD_PCUQ(0, "Thông tin quy định PCUQ"), PCUQ(1, "Khai báo PCUQ tại ban KDV&TT"),
			KSV_LD_PHE_DUYET_GD(2, "KSV/Lãnh đạo phê duyệt GD"),
			HD_KHUNG_HD_DAM_BAO(3, "Thông tin hợp đồng khung và hợp đông đảm bảo"), HAN_MUC_BO(4, "Hạn mức BO"),
			NHOM_EMAIL(5, "Nhóm email"), QUY_CHUAN_CT(6, "Quy chuẩn chứng từ"), DM_TSDB_BIDV(7, "Danh mục TSĐB tại BIDV"),
			DM_TSDB_BIDV_CC_TC(8, "Danh mục TSĐB BIDV cầm cố, thế cập tại đối tác"), CHUNG_TU_GD(9, "Chứng từ giao dịch"),
			THONG_TIN_GD(10, "Thông tin giao dịch"), THEO_DOI_CHUYEN_TRA(11, "Theo dõi chuyển trả"),
			THE0_DOI_GD_TSDB(12, "Theo dõi giao dịch TSĐB"), THEO_DOI_GD_VUOT_HM(13, "Theo dõi giao dịch vượt hạn mức"),
			KB_DOI_TAC_CAN_THEO_DOI(14, "Khai báo đối tác cần theo dõi"),
			THEO_DOI_HOP_DONG_GOC(15, "Theo dõi hợp đồng gốc"), BAO_CAO_TG_XU_LY_GD(16, "Báo cáo thời gian xử lý GD"),
			VAN_TIN(17, "Vấn tin"), BAO_CAO_HANG_NGAY(18, "Báo cáo hàng ngày"),
			DS_GD_CHUA_DU_CT(19, "Danh sách giao dịch chưa đủ CT"),
			KHAI_BAO_DOI_TAC_CTD(20, "Khai Báo Đối Tác Cần Theo Dõi"),
			CAP_NHAT_DU_LIEU_TINH(21, "Cập nhật thông tin dữ liệu tĩnh");

			private int funcode;
			private String funcname;

			private ChucNang(int funcode, String funcname) {
				this.funcode = funcode;
				this.funcname = funcname;
			}

			public int getFuncode() {
				return funcode;
			}

			public void setFuncode(int funcode) {
				this.funcode = funcode;
			}

			public String getFuncname() {
				return funcname;
			}

			public void setFuncname(String funcname) {
				this.funcname = funcname;
			}
		}
}

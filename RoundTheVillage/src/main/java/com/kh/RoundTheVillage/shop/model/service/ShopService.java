package com.kh.RoundTheVillage.shop.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

public interface ShopService {

	
	/** summernote 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @return
	 */
	public abstract ShopAttachment insertImage(MultipartFile uploadFile, String savePath);

	/** 공방 등록 Service
	 * @param shop
	 * @param image
	 * @param savePath 
	 * @return
	 */
	public abstract int registrateShop(Shop shop, List<MultipartFile> images, String savePath);

	
	/** 공방 등록 여부 확인 Service
	 * @param memberNo
	 * @return result
	 */
	public abstract int selectRegistrationFlag(int memberNo);

	
	/** 공방 상세 조회 Service
	 * @param memberNo
	 * @return result
	 */
	public abstract Shop selectShop(int memberNo);

	/** 공방 좋아요 개수 조회 Service
	 * @param memberNo
	 * @return csGoodCount
	 */
	public abstract int selectCsGoodCount(int memberNo);

	/** 수업 리스트 가져오기
	 * @param shopNo
	 * @return
	 */
	public abstract List<Lesson> selectlesList();

	/** 수업 썸네일 목록 조회
	 * @param lesList
	 * @return
	 */
	public abstract List<LessonFile> selectThumbnailList(List<Lesson> lesList);




}

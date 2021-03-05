package com.kh.RoundTheVillage.shop.exception;

public class updateAttachmentFailException extends RuntimeException {
	
	// RuntimeException은 예외 처리를 꼭 하지 않아도 되는 unchecked Exception의 최상위 부모다.
	
	// 이를 상속받은 자식은 모두 unchecked Exception이 된다
	
	public updateAttachmentFailException() {
		super();
	}
	
	public updateAttachmentFailException(String message) {
		super(message);
	}
}

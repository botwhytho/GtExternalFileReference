Class {
	#name : #MyColorNode,
	#superclass : #MyColorParseNode,
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #generated }
MyColorNode >> acceptVisitor: aColorParseVisitor [
	^ aColorParseVisitor visitColor: self
]

Class {
	#name : #LeExternalFileReferenceParseNode,
	#superclass : #SmaCCParseNode,
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]

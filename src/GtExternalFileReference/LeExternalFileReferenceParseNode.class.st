Class {
	#name : #LeExternalFileReferenceParseNode,
	#superclass : #SmaCCParseNode,
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceParseNode >> acceptVisitor: anExternalFileReferenceParseVisitor [
	^ anExternalFileReferenceParseVisitor visitExternalFileReferenceParse: self
]

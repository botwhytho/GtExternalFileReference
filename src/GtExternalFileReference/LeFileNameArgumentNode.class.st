Class {
	#name : #LeFileNameArgumentNode,
	#superclass : #LeArgumentNode,
	#instVars : [
		'path'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeFileNameArgumentNode >> acceptVisitor: anExternalFileReferenceParseVisitor [
	^ anExternalFileReferenceParseVisitor visitFileNameArgument: self
]

{ #category : #accessing }
LeFileNameArgumentNode >> changes [
	^ self attributeNamed: #changes
]

{ #category : #accessing }
LeFileNameArgumentNode >> changes: aGtEpicea [
	self attributeNamed: #changes put: aGtEpicea
]

{ #category : #accessing }
LeFileNameArgumentNode >> imageObject [
	^ self changes
]

{ #category : #generated }
LeFileNameArgumentNode >> path [
	^ path
]

{ #category : #generated }
LeFileNameArgumentNode >> path: aSmaCCToken [
	path := aSmaCCToken
]

{ #category : #generated }
LeFileNameArgumentNode >> tokenVariables [
	^ #(#path #value #equals)
]

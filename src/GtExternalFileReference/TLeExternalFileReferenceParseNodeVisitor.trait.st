Trait {
	#name : #TLeExternalFileReferenceParseNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #GtExternalFileReference
}

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitArgument: anArgument [
	^ self visitParse: anArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitEndArgument: anEndArgument [
	^ self visitArgument: anEndArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitExternalFileReferenceAnnotation: anExternalFileReferenceAnnotation [
	^ self visitParse: anExternalFileReferenceAnnotation
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitFileNameArgument: aFileNameArgument [
	^ self visitArgument: aFileNameArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitParse: aParse [
	^ self visitSmaCCParseNode: aParse
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitStartArgument: aStartArgument [
	^ self visitArgument: aStartArgument
]

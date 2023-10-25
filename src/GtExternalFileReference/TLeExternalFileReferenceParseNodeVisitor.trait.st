Trait {
	#name : #TLeExternalFileReferenceParseNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #GtExternalFileReference
}

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitArgument: anArgument [
	^ self visitExternalFileReferenceParse: anArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitEndArgument: anEndArgument [
	^ self visitArgument: anEndArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitExternalFileReferenceAnnotation: anExternalFileReferenceAnnotation [
	^ self visitExternalFileReferenceParse: anExternalFileReferenceAnnotation
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitExternalFileReferenceParse: anExternalFileReferenceParse [
	^ self visitSmaCCParseNode: anExternalFileReferenceParse
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitFileNameArgument: aFileNameArgument [
	^ self visitArgument: aFileNameArgument
]

{ #category : #generated }
TLeExternalFileReferenceParseNodeVisitor >> visitStartArgument: aStartArgument [
	^ self visitArgument: aStartArgument
]

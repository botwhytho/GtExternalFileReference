Trait {
	#name : #TMyColorParseNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #generated }
TMyColorParseNodeVisitor >> visitColor: aColor [
	^ self visitColorParse: aColor
]

{ #category : #generated }
TMyColorParseNodeVisitor >> visitColorParse: aColorParse [
	^ self visitSmaCCParseNode: aColorParse
]

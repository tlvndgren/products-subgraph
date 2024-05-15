check:
	rover subgraph check Tyler-Fed-Demo@prod \
	--schema=products.graphql \
	--name=products --validation-period=2w
	
publish:
	rover subgraph publish Tyler-Fed-Demo@prod --schema ./products.graphql \
		--name products --routing-url https://products-as4-bhl6lhslfa-uc.a.run.app

publish-staging:
	rover subgraph publish Tyler-Fed-Demo@staging --schema ./products.graphql \
		--name products --routing-url https://staging-products-bhl6lhslfa-uc.a.run.app
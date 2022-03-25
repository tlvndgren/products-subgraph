publish:
	rover subgraph publish Tyler-Fed-Demo@prod --schema ./products.graphql \
		--name products --routing-url https://products-subgraph-bhl6lhslfa-uc.a.run.app

publish-current:
	rover subgraph publish Tyler-Fed-Demo@current --schema ./products.graphql \
		--name products --routing-url https://products-subgraph-waaq4qt37q-uc.a.run.app

publish-staging:
	rover subgraph publish Tyler-Fed-Demo@staging --schema ./products.graphql \
		--name products --routing-url https://products-staging-waaq4qt37q-uc.a.run.app

check:
	rover subgraph check Tyler-Fed-Demo \
	--schema=products.graphql \
	--name=products --validation-period=2w
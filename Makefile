publish:
	rover subgraph publish Tyler-Fed-Demo@current --schema ./products.graphql \
		--name products --routing-url https://products-subgraph-waaq4qt37q-uc.a.run.app

check:
	rover subgraph check Tyler-Fed-Demo \
	--schema=products.graphql \
	--name=products --validation-period=2w
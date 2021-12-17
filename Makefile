publish:
	rover subgraph publish Ty-Demo@current --schema ./products.graphql \
		--name products --routing-url https://products-subgraph-waaq4qt37q-uc.a.run.app

check:
	rover subgraph check Ty-Demo \
	--schema=products.graphql \
	--name=products --validation-period=2w
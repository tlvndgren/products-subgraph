publish:
	rover subgraph publish Tyler-Fed-Demo@prod --schema ./products.graphql \
		--name products --routing-url https://prod-products-subgraph-bhl6lhslfa-uc.a.run.app

publish-staging:
	rover subgraph publish Tyler-Fed-Demo@staging --schema ./products.graphql \
		--name products --routing-url https://staging-products-bhl6lhslfa-uc.a.run.app

check:
	rover subgraph check Tyler-Fed-Demo@prod \
	--schema=products.graphql \
	--name=products --validation-period=2w

dev-publish:
	rover subgraph publish Tyler-Fed-Demo@prod --profile dev --schema ./products.graphql \
		--name products --routing-url https://prod-products-subgraph-bhl6lhslfa-uc.a.run.app
check:
	APOLLO_KEY=service:Ecom-Demo:B3ZfLDPWeM2BTKiRu2b37g \
	rover subgraph check Ecom-Demo@prod \
	--schema=products.graphql \
	--name=products --validation-period=2w
	
publish:
	APOLLO_KEY=service:Ecom-Demo:B3ZfLDPWeM2BTKiRu2b37g \
	rover subgraph publish Ecom-Demo@prod --schema ./products.graphql \
		--name products --routing-url https://products-as4-bhl6lhslfa-uc.a.run.app

publish-staging:
	rover subgraph publish Ecom-Demo@staging --schema ./products.graphql \
		--name products --routing-url https://staging-products-bhl6lhslfa-uc.a.run.app
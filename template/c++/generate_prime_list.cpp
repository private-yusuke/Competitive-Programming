
vector<unsigned long long> generate_prime_list(unsigned long long N) {
	vector<unsigned long long> prime_list;
	prime_list.push_back(2);
	bool not_prime = false;
	for (int i = 3; i <= N; ++i)
	{
		for (std::vector<unsigned long long>::iterator j = prime_list.begin(); j != prime_list.end(); ++j)
		{
			if(i % *j == 0)
			{
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list.push_back(i);
		not_prime = false;
	}
	return prime_list;
}
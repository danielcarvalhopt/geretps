puts 'seeding grades...'

grades = [
	{
		value: 95,
		comments: "Fizeram uma excelente apresentação, apenas com um defeito, excederam-se no tempo. Trabalho muito completo: introdução, estudo de mercado, funcionalidades, casos de estudo, arquitetura, workflows base especificados, modelo de dados especificado, prototipagem com mockups para as principais interfaces e modelo da homepage final, base de dados definida e criada. Apresentaram um bom planeamento e uma metodologia de trabalho e organização muito bem concebida e apoiada em sistemas eletrónicos como o github e um gestor de tarefas.",
		delivery_id: 1,
		student_id: 1
	},
	{
		value: 95,
		comments: "Fizeram uma excelente apresentação, apenas com um defeito, excederam-se no tempo. Trabalho muito completo: introdução, estudo de mercado, funcionalidades, casos de estudo, arquitetura, workflows base especificados, modelo de dados especificado, prototipagem com mockups para as principais interfaces e modelo da homepage final, base de dados definida e criada. Apresentaram um bom planeamento e uma metodologia de trabalho e organização muito bem concebida e apoiada em sistemas eletrónicos como o github e um gestor de tarefas.",
		delivery_id: 1,
		student_id: 2
	},
	{
		value: 95,
		comments: "Fizeram uma excelente apresentação, apenas com um defeito, excederam-se no tempo. Trabalho muito completo: introdução, estudo de mercado, funcionalidades, casos de estudo, arquitetura, workflows base especificados, modelo de dados especificado, prototipagem com mockups para as principais interfaces e modelo da homepage final, base de dados definida e criada. Apresentaram um bom planeamento e uma metodologia de trabalho e organização muito bem concebida e apoiada em sistemas eletrónicos como o github e um gestor de tarefas.",
		delivery_id: 1,
		student_id: 3
	},
	{
		value: 85,
		comments: "Aplicação bem elaborada, código bastante legível.",
		delivery_id: 2,
		student_id: 1
	},
	{
		value: 85,
		comments: "Aplicação bem elaborada, código bastante legível.",
		delivery_id: 2,
		student_id: 2
	},
	{
		value: 85,
		comments: "Aplicação bem elaborada, código bastante legível.",
		delivery_id: 2,
		student_id: 3
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 3,
		student_id: 4
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 3,
		student_id: 5
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 3,
		student_id: 6
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 4,
		student_id: 7
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 4,
		student_id: 8
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 5,
		student_id: 9
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 5,
		student_id: 10
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 6,
		student_id: 11
	},
	{
		value: 90,
		comments: "Bom planeamento. Apenas uma falha no modelo de dominio",
		delivery_id: 6,
		student_id: 12
	}
]

grades.each do |grade|
	Grade.where(grade).first_or_create!
end

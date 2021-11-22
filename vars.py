import random
random.seed()
standard_length = 14

def generate_random_id():
    id_string = ''
    for i in range(0, standard_length):
        rand_num = random.randrange(9) + 1
        while i == 0 and rand_num == 0:
            rand_num = random.randrange(9) + 1
        id_string += str(rand_num)
    return id_string

host = 'https://www.officemate.co.th/'
apitest = 'api/childrenCategories/en/2104,2171,2202,2213,2217,4861,4862,956,964,968,976,991,995'


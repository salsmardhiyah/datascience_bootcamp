def grading(list_nilai):
    '''(list) -> str

    objective:
    melakukan konversi rata-rata nilai angka pada list menjadi segmen huruf

    parameter:
    nilai : sebuah list yang berisi kumpulan niali-nilai (integer)

    >>> grading([70, 89, 88, 98, 90])
    'A'
    >>> grading([100, 99, 98, 97,'o'])
    'masukkan list nilai berisi integer'
    >>> grading([])
    0
    >>> grading([20, 30, 98, 97, 40])
    'C'
    '''
    try:
        sum_nilai = 0
        for nilai in list_nilai:
            sum_nilai = sum_nilai + nilai
                
        mean_nilai = sum_nilai / len(list_nilai)
        if mean_nilai > 85:
            result = 'A'
        elif mean_nilai > 75:
            result = 'B'
        else:
            result = 'C'
        return result
    
    except ZeroDivisionError :
        return 0
    except TypeError :
        return 'masukkan list nilai berisi integer'
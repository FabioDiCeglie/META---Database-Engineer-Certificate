## SELECTION SORT
def selection_sort(List):
    n = len(List)
    for i in range(n - 1):
        min_index = i
        for j in range(i + 1, n):
            if List[j] < List[min_index]:
                min_index = j
        List[i], List[min_index] = List[min_index], List[i]

## QUICKSORT
def quick_sort(List, low, high):
    if low < high:
        pivot = partition(List, low, high)
        quick_sort(List, low, pivot - 1)
        quick_sort(List, pivot + 1, high)

## PARTITION
def partition(List, low, high):
    pivot = List[high]
    i = low - 1
    for j in range(low, high):
        if List[j] < pivot:
            i += 1
            List[i], List[j] = List[j], List[i]
    List[i + 1], List[high] = List[high], List[i + 1]
    return i + 1
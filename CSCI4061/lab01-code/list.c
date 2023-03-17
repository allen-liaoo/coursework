#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "list.h"

void list_init(list_t *list) {
    list->head = NULL;
    list->size = 0;
}

void list_add(list_t *list, const char* data) {
    node_t *new = malloc(sizeof(node_t));
    strcpy(new->data, data);
    new->next = NULL;

    if (list->size == 0) {
        list->head = new;
    } else {
        node_t *tail = list->head;
        for (int i = 0; i < list->size-1; i++) {
            tail = tail->next;
        }
        tail->next = new;
    }
    list->size = list->size + 1;
}

int list_size(const list_t *list) {
    return list->size;
}

char *list_get(const list_t *list, int index) {
    if (index < 0 || index > list->size) {
        return NULL;
    }
    node_t *tail = list->head;
    int count = 0;
    while (count != index) {
        count++;
        tail = tail->next;
    }
    return tail->data;
}

void list_clear(list_t* list) {
    node_t *tail = list->head;
    while (tail != NULL) {
		node_t *temp = tail;
		tail = tail->next;
		free(temp);
	}
}

int list_contains(const list_t *list, const char *query) {
    node_t *tail = list->head;
	while (tail != NULL) {
		if (!strcmp(tail->data, query))
			return 1;
		tail = tail->next;
	}
    return 0;
}

void list_print(const list_t *list) {
    int i = 0;
    node_t *current = list->head;
    while (current != NULL) {
        printf("%d: %s\n", i, current->data);
        current = current->next;
        i++;
    }
}
typedef struct Node* Node;

struct Node {
	int n_children;
	Node* children;
	int type;
};


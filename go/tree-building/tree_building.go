// Package tree ...
package tree

import (
	"errors"
	"sort"
)

// Record ...
type Record struct {
	ID, Parent int
}

// Node ...
type Node struct {
	ID       int
	Children []*Node
}

// ByID for sorting
type ByID []Record

func (r ByID) Len() int           { return len(r) }
func (r ByID) Swap(i, j int)      { r[i], r[j] = r[j], r[i] }
func (r ByID) Less(i, j int) bool { return r[i].ID < r[j].ID }

// recordHasError ...
func recordHasError(i int, r Record) (bool, error) {
	if r.ID != i {
		return true, errors.New("records not contiguous")
	}
	if r.ID == 0 && r.Parent != 0 {
		return true, errors.New("root record has a parent")
	}
	if r.ID != 0 && r.ID <= r.Parent {
		return true, errors.New("parent is not valid")
	}
	return false, nil
}

// Build implements the tree algorithm
func Build(records []Record) (*Node, error) {
	if len(records) == 0 {
		return nil, nil
	}
	sort.Sort(ByID(records))
	nodes := make([]Node, len(records))
	for i, r := range records {
		hasError, errorMessage := recordHasError(i, r)
		if hasError {
			return nil, errorMessage
		}
		nodes[i] = Node{ID: r.ID}
		if i != 0 {
			parent := &nodes[r.Parent]
			parent.Children = append(parent.Children, &nodes[i])
		}
	}
	return &nodes[0], nil
}

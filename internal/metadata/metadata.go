/*
 *
 * Copyright 2020 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

// Package metadata contains functions to set and get metadata from addresses.
//
// This package is experimental.
package metadata

import (
	"github.com/xd-luqiang/grpc-go/metadata"
	"github.com/xd-luqiang/grpc-go/resolver"
)

type mdKeyType string

const mdKey = mdKeyType("grpc.internal.address.metadata")

type mdValue metadata.MD

func (m mdValue) Equal(o interface{}) bool {
	om, ok := o.(mdValue)
	if !ok {
		return false
	}
	if len(m) != len(om) {
		return false
	}
	for k, v := range m {
		ov := om[k]
		if len(ov) != len(v) {
			return false
		}
		for i, ve := range v {
			if ov[i] != ve {
				return false
			}
		}
	}
	return true
}

// Get returns the metadata of addr.
func Get(addr resolver.Address) metadata.MD {
	attrs := addr.Attributes
	if attrs == nil {
		return nil
	}
	md, _ := attrs.Value(mdKey).(mdValue)
	return metadata.MD(md)
}

// Set sets (overrides) the metadata in addr.
//
// When a SubConn is created with this address, the RPCs sent on it will all
// have this metadata.
func Set(addr resolver.Address, md metadata.MD) resolver.Address {
	addr.Attributes = addr.Attributes.WithValue(mdKey, mdValue(md))
	return addr
}
